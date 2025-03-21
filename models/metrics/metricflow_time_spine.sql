-- metricflow_time_spine.sql
--for BQ adapters use "DATE('01/01/2000','mm/dd/yyyy')"
with days as (
    {{dbt_utils.date_spine('day'
    , "parse_date('mm/dd/yyyy','01/01/2000')"
    , "parse_date('mm/dd/yyyy','01/01/2027')"
    )
    }}
),

final as (
    select cast(date_day as date) as date_day
    from days
)

select *
from final