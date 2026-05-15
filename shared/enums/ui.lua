-- ---------------------------------------------------------------------------
-- UI enums shared across server and client. Only enums that cross the
-- server/client event boundary live here. Purely client-side UI concerns
-- (positions, dialog results, menu states) are owned by lw-ui-core.
--
-- Server-side scripts use these when constructing notification event
-- payloads so the client knows how to render and prioritize them.
-- ---------------------------------------------------------------------------
LWEnum = LWEnum or {}

LWEnum.NotificationType = {
    Success = 'success', -- positive outcome: transaction complete, action succeeded
    Error   = 'error',   -- failure: invalid action, insufficient funds, blocked
    Warning = 'warning', -- cautionary: low ammo, needs critical, wanted level rising
    Info    = 'info',    -- neutral information: time update, weather change, system message
}

LWEnum.NotificationPriority = {
    Low      = 'low',      -- ambient info, can be dropped if queue is full
    Normal   = 'normal',   -- standard priority, queued in order
    High     = 'high',     -- important, jumps standard queue
    Critical = 'critical', -- must display immediately regardless of queue state
}