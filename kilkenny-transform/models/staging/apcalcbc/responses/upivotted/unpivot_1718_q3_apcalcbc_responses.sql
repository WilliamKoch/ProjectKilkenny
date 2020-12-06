{{ config(
    materialized='table'
)}}

with unpivotted as (
    {{ dbt_utils.unpivot(
        relation=ref('base_1718_q3_apcalcbc_responses'),
        cast_to='string',
        exclude=['student_id'],
        field_name='question',
        value_name='response'
    )}}
)

select * from unpivotted