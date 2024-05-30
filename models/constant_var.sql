select *
from '{{ var("db_schema") }}'.dim_venues where venuename = '{{ var("venue_name") }}' 
