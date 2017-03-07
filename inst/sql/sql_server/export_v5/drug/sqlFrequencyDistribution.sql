select c1.concept_id as CONCEPT_ID, 
	c1.concept_name as CONCEPT_NAME,
	num.stratum_2 as Y_NUM_PERSONS,
	num.count_value as X_COUNT
from 
	(select CAST(stratum_1 as int) stratum_1, CAST(stratum_2 as decimal) stratum_2, count_value 
	from @results_database_schema.ACHILLES_results 
	where analysis_id = 791) num
	inner join @vocab_database_schema.concept c1 on num.stratum_1 = c1.concept_id
	order by num.stratum_2
	