function func(typeF) {

    let resXY = {
        resX: [],
        resY: []
    }
    const M_PI = 3.14159
    if(typeF === "Star") {
        const R = 40
        const r = 20
        const n = 6
        var x = 0, y = 0, a = 0
        for (var i = 0; i < n * 2 + 1; i++) {
                if (!(i % 2)) {
                    resXY.resX[i] = x + r * Math.cos(a * M_PI / 180)
                    resXY.resY[i] = y - r * Math.sin(a * M_PI / 180)
                }
                else {
                    resXY.resX[i] = x + R * Math.cos(a * M_PI / 180);
                    resXY.resY[i] = y - R * Math.sin(a * M_PI / 180);
                }
                a = a + 180 / n;
            }
            resXY.resX[n * 2] = resXY.resX[0]
            resXY.resY[n * 2] = resXY.resY[0]
    }
    if(typeF === "Circle") {
        var Rad = 50
        resXY.resX[0] = Rad
        resXY.resY[0] = 0
        var alfa = 0
        for(var j = 1; j < 36; j++) {
            alfa += 20
            resXY.resX[j] = Math.round(Rad * Math.cos(alfa*M_PI/360))
            resXY.resY[j] = Math.round(Rad * Math.sin(alfa*M_PI/360))
        }
    }
    if(typeF === "House") {
        resXY.resX = [10, 50, 50, 60, 30, 0, 10, 10];
        resXY.resY = [60, 60, 30, 30, 15, 30, 30, 60];
    }
    if(typeF === "Watches") {
        resXY.resX = [0, 50, 50, 30, 50, 50, 0, 0, 20, 0, 0];
        resXY.resY = [0, 0, 30, 50, 70, 100, 100, 70, 50, 30, 0];
    }
    return resXY
}

function dynamicLoad (parent) {
    var loadForm = Qt.createComponent("login.qml")
    var sprite = loadForm.createObject(parent);
    if (sprite == null) {
    // Error Handling
    console.log("Error creating object");
    }
}
