{#
	This test is basically a "not_null" and "unique"
	rolled into one.

	It fails if a column is NULL or occurs more than once
#}

{% test primary_key(model, column_name) %}

WITH validation AS (
	SELECT
		{{ column_name }} AS primary_key,
		COUNT(1) AS occurrences

	FROM {{ model }}
	GROUP BY 1
)

SELECT *

FROM validation
WHERE primary_key IS NULL
	OR occurrences > 1

{% endtest %}

{# test to see if the incoming column is greater than a specific value #}
{% test col_greater_than(model, column_name, value=0) %}
    select
        column_name as row_that_failed
    from {{ model }}
    where {{ column_name }} <= {{ value }}

{% endtest %}