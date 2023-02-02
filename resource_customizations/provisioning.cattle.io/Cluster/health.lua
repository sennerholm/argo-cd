function getUpdatedContitionStatus(obj, hs)
    if obj.status ~= nil and obj.status.conditions ~= nil then
        for i, condition in ipairs(obj.status.conditions) do
        if condition.type == "Updated" and condition.status ~= "True" then
            hs.status = "Progressing"
            hs.message = condition.message
            return hs
        end
        end
    end
    return hs
end


function getReadyContitionStatus(obj, hs)

    if obj.status ~= nil and obj.status.conditions ~= nil then
        for i, condition in ipairs(obj.status.conditions) do
        if condition.type == "Ready" and condition.status == "False" then
            hs.status = "Degraded"
            hs.message = condition.message
            return hs
        end
        end
    end
    return hs
end
hs = {}
hs.status = "Healthy"
hs.message = "Cluster is running"
getUpdatedContitionStatus(obj, hs)
getReadyContitionStatus(obj, hs)

return hs
