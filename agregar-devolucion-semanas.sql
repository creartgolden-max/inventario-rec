-- ============================================================
-- Recouromex · Inventario
-- Agrega soporte para DEVOLVER un cierre a Alma (rechazo del Director).
-- Pegar en el SQL Editor de Supabase y ejecutar UNA vez.
-- Es seguro correrlo varias veces (usa IF NOT EXISTS).
-- ============================================================

alter table public.semanas
  add column if not exists motivo_devolucion text,
  add column if not exists devuelta_por      text,
  add column if not exists fecha_devuelta    timestamptz;

-- Estados que usa el sistema en la columna "estado":
--   (sin fila) / PENDIENTE  -> esperando aprobacion del Director
--   DEVUELTA                -> el Director la regreso a Alma para corregir
--   CERRADA                 -> aprobada por el Director
