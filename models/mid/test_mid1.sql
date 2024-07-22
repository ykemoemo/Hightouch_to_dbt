{{ config( materialized = 'ephemeral' ) }}

SELECT
     T01.ID
    ,T01.NAME
    ,T01.EMAIL
    ,ROW_NUMBER() OVER() AS NUM
FROM
    sixth-utility-407301.test_yamashita.dbt_test_master T01
LEFT JOIN
    sixth-utility-407301.test_yamashita.test_sentlog T02
  ON
    T01.ID = T02.ID
WHERE
    T01.PERMISSION = 1
  AND
    (
    T02.ID IS NULL
    OR
    date_diff(T02.SENT_DATE, {{now()}}, DAY) >= 1
    )
