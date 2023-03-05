{{ config(
    materialized='table'
)}}

with q1_responses as (
    select * from {{ ref('unpivot_1718_q1_apcalcbc_responses')}}
), 

q2_responses as (
    select * from {{ ref('unpivot_1718_q2_apcalcbc_responses')}}
),

q3_responses as (
    select * from {{ ref('unpivot_1718_q3_apcalcbc_responses')}}
),

unioned as (

    select
        *,
        'q1' as quarter,
        '1718' as year
    from q1_responses

    union all

    select
        *,
        'q2' as quarter,
        '1718' as year
    from q2_responses

    union all
    
    select 
        *,
        'q3' as quarter,
        '1718' as year
    from q3_responses

),

final as (
    select 
        {{ dbt_utils.surrogate_key(['student_id','question','quarter','year'])}} as response_id,
        {{ dbt_utils.surrogate_key(['question','quarter','year'])}} as question_id,
        student_id,
        question,
        quarter,
        year,
        response,

    from unioned
)

select * from final