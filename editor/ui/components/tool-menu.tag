<tool-menu>
	<ul class="tool-menu__list">
		<li class="tool-menu__item { tool-menu__item--active: active }" each={ items } data={ this} title={ displayText } onclick={ parent.clickTool }>
			<img src="images/{ icon }"/>
		</li>
	</ul>

	<script>
	this.items = [
		{
			name: 'ADD_TILE',
			displayText: 'Add Tile',
			icon: 'add-tile.png',
			active: true
		},
		{
			name: 'REMOVE_TILE',
			displayText: 'Remove Tile',
			icon: 'remove-tile.png',
			active: false
		},
	];

	clickTool(evt) {
		var item = evt.item;
		if (ui.activeTool.name === item.name) return;

		ui.activeTool.active = false;

		item.active = true;
		ui.activeTool = item;

		ui.trigger(ui.Events.TOOL_CHANGE, ui.Tools[item.name]);
		this.update();
	}

	this.on('mount', function() {
		ui.activeTool = this.items[0];
		ui.trigger(ui.Events.TOOL_CHANGE, ui.Tools[ui.activeTool]);
	});
	</script>
</tool-menu>