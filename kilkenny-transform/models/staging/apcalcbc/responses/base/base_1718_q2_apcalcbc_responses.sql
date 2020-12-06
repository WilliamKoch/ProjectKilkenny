with source as (

    select * from {{ source('apcalcbc', '1718_q2_apcalcbc_responses') }}

),

renamed as (

    select
    -- student info
        id as student_id,

    -- responses
        q1,
        q2,
        q3,
        q4,
        q5,
        q6,
        q7,
        q8,
        q9,
        q10,
        q11,
        q12,
        q13,
        q14,
        q15,
        q16,
        q17,
        q18,
        q19,
        q20,
        q21,
        q22,
        q23,
        q24,
        q25,
        q26,
        q27,
        q28,
        q29,
        q30,
        q76,
        q77,
        q78,
        q79,
        q80,
        q81,
        q82,
        q83,
        q84,
        q85,
        q86,
        q87,
        q88,
        q89,
        q90,
        o1a,
        o1b,
        o1c,
        o1d,
        o2a,
        o2b,
        o2c,
        o2d,
        o3a,
        o3b,
        o3c,
        o4a,
        o4b,
        o4c,
        o5a,
        o5b,
        o5c,
        o6a,
        o6b,
        o6c,
        o6d

        -- ignored
        -- first_last,

    from source

)

select * from renamed