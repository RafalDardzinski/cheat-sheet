/*
  This script distributes passed elements evenly inside the passed container element.
  This is modified version of a script by ThiefMaster published on stack overflow: https://stackoverflow.com/a/10152437/7480906
  It's implemented in vanilla ES5. Used classic for-loop since IE11 doesn't have NodeList.prototype.forEach.
*/

function distributeElements(container, elements) {
  var radius = getElementRadius(container);
  var width = container.offsetWidth,
    height = container.offsetHeight,
    angle = 180, step = (2*Math.PI) / elements.length;
    
    console.log('width: ' + width + '\nheight: ' + height);
    
    for (var i = 0; i < fields.length; i++) {
        var x = Math.round(width / 2 + radius * Math.cos(angle) - elements[i].offsetWidth / 2);
        var y = Math.round(height / 2 + radius * Math.sin(angle) - elements[i].offsetHeight / 2);
        
        elements[i].style.left = x + 'px';
        elements[i].style.top = y + 'px';
        
        console.log('x: ' + x + '\ny: ' + y);
        angle += step;
    }
    
    function getElementRadius (circularElement) {
        return circularElement.offsetWidth / 2;
    }
}
