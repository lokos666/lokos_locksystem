# lokos_locksystem
Najprostszy mozliwy locksystem dla ox_inventory. Nie wiem czy dziala bo dawno go nie tykalem, ale jak smiga to nadajesz kluczyki komenda/triggerem i uzywasz itemu - wszystko oparte na metadacie

## Wklej to
@ox_inventory/modules/items/client.lua
```lua
Item('keys', function(data, slot)
	exports.lokos_locksystem:useKeys(slot.metadata.description)
end)
```

@ox_inventory/data/items.lua
```lua
['keys'] = {
		weight = 20,
		label = 'Kluczyki',
		stack = false -- !
},
```

## Support
Nie udzielam, jak nie dziala i nie potrafisz wykonac troubleshootingu tak prostego skryptu nie polecam pakowac sie w fivema.

## Dependencje
- ox_inventory
- ox_lib 

[Overextended](https://github.com/overextended)
