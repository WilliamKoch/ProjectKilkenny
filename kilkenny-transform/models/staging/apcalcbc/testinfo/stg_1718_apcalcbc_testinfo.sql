{{ config(
    materialized='table'
)}}

with q1_testinfo as (
    select * from {{ ref('base_1718_q1_apcalcbc_testinfo') }}
),

q2_testinfo as (
    select * from {{ ref('base_1718_q2_apcalcbc_testinfo') }}
),

q3_testinfo as (
    select * from {{ ref('base_1718_q3_apcalcbc_testinfo') }}
),

unioned as (
    select
        *,
        'q1' as quarter,
        '1718' as year
    from q1_testinfo

    union all

    select 
        *,
        'q2' as quarter,
        '1718' as year
    from q2_testinfo

    union all

    select 
        *,
        'q3' as quarter,
        '1718' as year
    from q3_testinfo
),

recasted as (
    select 
        case 
            when question_type = 'MC' then concat('q',question_number)
            when question_type = 'OER' then lower(question_number)
        end as question_number,
        quarter,
        year,
        question_type,
        difficulty,
        total_points,
        correct_answer,
        primary_standard,
        secondary_standard
    from unioned
    order by question_number
),

keyed as (
    select
       {{ dbt_utils.surrogate_key(['question_number','quarter','year'])}} as question_id,
       *
    from recasted
)

select * from keyed