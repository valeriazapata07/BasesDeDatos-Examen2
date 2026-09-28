
USE Discografia
GO

-- a.
SELECT COUNT(*) AS TotalCanciones
FROM CancionCompositor cc
JOIN Compositor co ON co.Id = cc.IdCompositor
WHERE CHARINDEX('JUANES', co.Nombre) > 0;
GO

-- b.
SELECT i.Nombre AS Interprete, r.Ritmo, it.Duracion
FROM Interpretacion it
JOIN Cancion c ON c.Id = it.IdCancion
JOIN Interprete i ON i.Id = it.IdInterprete
JOIN Ritmo r ON r.Id = it.IdRitmo
WHERE c.Titulo = 'Lluvia';
GO

-- c.
SELECT DISTINCT c.Titulo AS Cancion, i.Nombre AS Interprete
FROM Interpretacion it
JOIN Cancion c ON c.Id = it.IdCancion
JOIN Interprete i ON i.Id = it.IdInterprete
JOIN Tipo t ON t.Id = i.IdTipo
JOIN Ritmo r ON r.Id = it.IdRitmo
JOIN CancionCompositor cc ON cc.IdCancion = c.Id
JOIN Compositor co ON co.Id = cc.IdCompositor
WHERE r.Ritmo = 'Balada'
  AND t.Tipo = 'Solista'
  AND CHARINDEX(i.Nombre, co.Nombre) > 0;
GO

-- d.
SELECT DISTINCT p.Nombre AS Pais
FROM Interpretacion it
JOIN Interprete i ON i.Id = it.IdInterprete
JOIN Tipo t ON t.Id = i.IdTipo
JOIN Pais p ON p.Id = i.IdPais
JOIN Ritmo r ON r.Id = it.IdRitmo
WHERE r.Ritmo = 'Salsa'
  AND t.Tipo = 'Grupo';
GO

-- e.
SELECT c.Titulo AS Cancion, i.Nombre AS Interprete
FROM Interpretacion it
JOIN Cancion c ON c.Id = it.IdCancion
JOIN Interprete i ON i.Id = it.IdInterprete
WHERE c.Titulo LIKE 'Candilejas'
   OR c.Titulo LIKE 'Malague%';
GO

-- f.
SELECT i.Nombre AS Artista,
       COUNT(DISTINCT cc.IdCancion) AS CancionesCompuestas,
       COUNT(DISTINCT it.IdCancion) AS CancionesInterpretadas
FROM Interprete i
JOIN Compositor co ON CHARINDEX(i.Nombre, co.Nombre) > 0
JOIN CancionCompositor cc ON cc.IdCompositor = co.Id
JOIN Interpretacion it ON it.IdInterprete = i.Id
GROUP BY i.Nombre;
GO