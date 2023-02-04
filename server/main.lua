lib.addCommand('group.admin', {'addkeys', 'givekeys'}, function(source, args)
    TriggerEvent('lokos_locksystem:addKeys', args.target, args.plate)
end, {'target:number', 'plate:string'})

lib.addCommand('group.admin', {'removekeys'}, function(source, args)
    TriggerEvent('lokos_locksystem:removeKeys', args.target, args.plate) 
end, {'target:number', 'plate:string'})

RegisterServerEvent('lokos_locksystem:addKeys', function(target, plate)
    if target and plate then 
        print('Dodano kluczyki: ' .. target .. ' ' .. plate)
        exports.ox_inventory:AddItem(target, 'keys', 1, {description = plate})
    end 
end)

RegisterServerEvent('lokos_locksystem:removeKeys', function(target, plate)
    if target and plate then 
        local item = exports.ox_inventory:GetItem(target, 'keys', {description = plate})

        if item then 
            print('Usunięto kluczyki: ' .. target .. ' ' .. plate)
            exports.ox_inventory:RemoveItem(target, 'keys', 1, {description = plate})
        end 
    end 
end)