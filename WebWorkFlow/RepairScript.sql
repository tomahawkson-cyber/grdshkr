/*****************************/
/*حذف درخواستهای تایید شده روزانه از حضور غیاب در صورتی که ابطال شده است */
/*****************************/
DELETE FROM MOR_MAM WHERE RefNumber IN (
SELECT mm.RefNumber
FROM   Requests                 AS r
       LEFT OUTER JOIN MOR_MAM  AS mm
            ON  mm.EMP_NO = r.EMP_NO
            AND mm.S_DATE = CAST(r.StartDate AS FLOAT) + 2
            AND mm.E_DATE = CAST(r.EndDate AS FLOAT) + 2
            AND mm.TYP = r.[Type]
WHERE  r.AcceptCode = 22
       AND r.EndDate IS NOT NULL
       AND mm.RefNumber IS NOT NULL
)   