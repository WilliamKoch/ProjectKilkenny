with source as (

    select * from {{ source('apcalcbc', '1718_q3_apcalcbc_testinfo') }}

),

renamed as (

    select
        -- ids
        question_number,

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