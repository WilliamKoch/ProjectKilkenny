with responses as (
    select * from {{ ref('stg_1718_apcalcbc_responses') }}
), 

testinfo as (
    select * from {{ ref('stg_1718_apcalcbc_testinfo') }}
),

joined as (
    select
        responses.response_id,
        responses.question_id,
        responses.student_id,
        responses.question,
        responses.quarter,
        responses.year,
        responses.response,
        testinfo.question_type,
        testinfo.difficulty,
        total_points,
        correct_answer,
        primary_standard,
        secondary_standard,
        case 
            when responses.response = testinfo.correct_answer then true
            else false
        end as is_correct,
        -- case 
        --     when question_type = 'MC' and is_correct = true then testinfo.total_points
        --     when question_type = 'MC' and is_correct = false then 0
        --     when question_type = 'OER' then responses.response
        -- end as points_earned

    from responses
    
    left join testinfo
    on responses.question_id = testinfo.question_id
)

select * from joined