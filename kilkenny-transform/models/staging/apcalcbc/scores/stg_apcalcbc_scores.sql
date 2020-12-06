with source as (

    select * from {{ source('apcalcbc', '1718_apcalcbc_scores') }}

),

renamed as (

    select
        -- student_info
        student_id,
        ap_id,

        -- scores
        ap_score

        -- ignored
        -- last__first,
        -- string_field_4,
        -- string_field_5,
        -- string_field_6

    from source

)

select * from renamed