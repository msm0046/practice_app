SELECT
  COUNT(*) AS count_all,
  "names"."name" AS names_name
FROM "names"
INNER JOIN
  "attendances"
ON
  "attendances"."name_id" = "names"."id"
GROUP BY "names"."name";

/* where を使いたいけど、どこで使えばいい...? */
SELECT
  "names"."name" AS names_name
FROM "names"
  INNER JOIN
    "attendances"
  ON
    "attendances"."name_id" = "names"."id"
GROUP BY "names"."name";

SELECT
  COUNT(*) AS count_all,
  "names"."name" AS names_name
FROM "names"
INNER JOIN
  "attendances"
ON
  "attendances"."name_id" = "names"."id"
GROUP BY "names"."name";

SELECT
  COUNT(*) AS count_all,
  "names"."name" AS names_name
FROM "names"
WHERE "attendances"."attendance_date" BETWEEN "2021-01-09" AND "2021-01-09";

/* 日付範囲を指定して、出席数を集計 */
SELECT
  COUNT(*) AS count_all,
  "names"."name" AS names_name
FROM "names", "attendances"
WHERE "attendances"."name_id" = "names"."id"
  AND "attendances"."attendance_date" BETWEEN '2020-01-01' AND '2021-01-09'
GROUP BY "names"."name";