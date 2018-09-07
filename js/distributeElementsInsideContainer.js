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
    
    for (var i = 0; i < elements.length; i++) {
        var element = elements[i];
        var x = Math.round(width / 2 + radius * Math.cos(angle) - element.offsetWidth / 2);
        var y = Math.round(height / 2 + radius * Math.sin(angle) - element.offsetHeight / 2);
        
        element.style.left = x + 'px';
        element.style.top = y + 'px';
        
        angle += step;
    }
    
    function getElementRadius (circularElement) {
        return circularElement.offsetWidth / 2;
    }
}
