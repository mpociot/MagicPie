var MagicPie = require('nl.fokkezb.magicpie');

var win = Titanium.UI.createWindow({  
    backgroundColor:'#fff'
});

var view = MagicPie.createView();

win.add(view);

win.add(Ti.UI.createLabel({
  bottom: 10,
  text: 'You should see a delicious pie'
}));

win.open();