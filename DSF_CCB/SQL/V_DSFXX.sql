USE [ZY_YYGL_DB]
GO

/****** Object:  View [dbo].[V_DSFXX]    Script Date: 05/28/2018 22:54:57 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_DSFXX]'))
DROP VIEW [dbo].[V_DSFXX]
GO

USE [ZY_YYGL_DB]
GO

/****** Object:  View [dbo].[V_DSFXX]    Script Date: 05/28/2018 22:54:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_DSFXX]
AS
SELECT     a.jylb, a.YHH, u.YHM, u.CBBBH, ISNULL(x.CBBMC, '') AS CBBMC, u.XXDZ AS address, a.jyrq, a.jyje, a.SFRBH, a.SFRXM, a.CJRQ, a.jyls, a.BQQL, a.bqqf, a.SCJY, a.yjje, a.bqznj, a.LJQF, a.LJZNJ, 
                      a.jfje, a.BCJY, CONVERT(varchar(6), a.jyrq, 112) AS yf
FROM         (SELECT     '½É·Ñ' AS jylb, j.YHH, j.JFRQ AS jyrq, j.JFJE AS jyje, j.SFRBH, j.SFRXM, j.CJRQ, j.BH AS jyls, 0 AS BQQL, j.QFJE AS bqqf, 0 AS SCJY, j.JJJE AS yjje, j.BCZNJ AS bqznj, j.LJQF, j.LJZNJ, 
                                              j.YJJE AS jfje, 0 AS BCJY
                       FROM          dbo.Q_JFXX AS j INNER JOIN
                                              dbo.X_YGXX AS y ON j.SFRBH = y.BH AND y.YGLX = '02'
                       WHERE      (j.ZTBZ = 1)
                       UNION
                       SELECT     'Ô¤´æ' AS jylb, c.YHH, c.YCSJ AS jyrq, c.YCJE AS jyje, c.SFRBH, c.SFRXM, c.CJRQ, c.BH AS jyls, 0 AS bqql, 0 AS bqqf, c.SCJY, 0 AS yjje, 0 AS bqznj, 0 AS ljqf, 0 AS ljznj, 0 AS jfje, 
                                             c.BCJY
                       FROM         dbo.Q_YHYC AS c INNER JOIN
                                             dbo.X_YGXX AS y ON c.SFRBH = y.BH AND y.YGLX = '02'
                       WHERE     (c.ZTBZ = 1)
                       UNION
                       SELECT     'ÍË¿î' AS jylb, t.YHH, t.TKRQ AS jyrq, 0 - t.TKJE AS jyje, t.SFRBH, t.SFRXM, t.CJRQ, t.BH AS jyls, 0 AS bqql, 0 AS bqqf, 0 AS scjy, 0 AS yjje, 0 AS bqznj, 0 AS ljqf, 0 AS ljznj, 0 AS jfje, 
                                             0 AS bcjy
                       FROM         dbo.Q_TKXX AS t INNER JOIN
                                             dbo.X_YGXX AS y ON t.SFRBH = y.BH AND y.YGLX = '02'
                       WHERE     (t.ZTBZ = 1)) AS a INNER JOIN
                      dbo.U_YHXX AS u ON a.YHH = u.YHH LEFT OUTER JOIN
                      dbo.X_CBB AS x ON u.CBBBH = x.CBBBH

GO
