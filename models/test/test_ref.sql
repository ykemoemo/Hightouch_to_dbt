(
SELECT  *  FROM  {{ref("test_ref_1")}}
)
UNION ALL
(
SELECT  *  FROM  {{ref("test_ref_2")}}
)