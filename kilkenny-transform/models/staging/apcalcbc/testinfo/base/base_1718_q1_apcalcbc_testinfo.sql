with source as (

    select * from {{ source('apcalcbc', '1718_q1_apcalcbc_testinfo') }}

),

renamed as (

    select
        -- ids
        case 
            when question_type = 'MC' then concat('q',question_number)
            when question_type = 'OER' then lower(question_number)
        end as question_number,

        -- standards
        question_type,
        difficulty,
        total_points,
        answer_choices,
        correct_answer,
        primary_standard,
        secondary_standard

        -- ignored
        -- year,
        -- title,
        -- subject_area,
        -- low_end,
        -- high_end,
        -- grade_code,
        -- grade,
        -- document

    from source
    where question_number is not null

)

select * from renamed