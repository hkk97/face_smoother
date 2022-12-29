window.smoothFilter = function smoothFilter(v1, v2) {
     let imgElement = document.getElementById('img');
     let mat = cv.imread(imgElement);
     let dst = new cv.Mat();
     var dx = 4 * v1, fc = v1 * 12.5, p = 0.1;
     let temp1 = new cv.Mat(), temp2 = new cv.Mat(), temp3 = new cv.Mat(), temp4 = new cv.Mat(), temp22 = new cv.Mat(), temp44 = new cv.Mat();
     cv.cvtColor(mat, mat, cv.COLOR_RGBA2RGB, 0);
     cv.bilateralFilter(mat, temp1, dx, fc, fc);
     cv.subtract(temp1, mat, temp22);
     cv.add(temp22, new cv.Mat(mat.rows, mat.cols, mat.type(), new cv.Scalar(128, 128, 128, 128)), temp2);
     cv.GaussianBlur(temp2, temp3, new cv.Size(2 * v2 - 1, 2 * v2 - 1), 0, 0);
     temp3.convertTo(temp44, temp3.type(), 2, -255);
     cv.add(mat, temp44, temp4);
     cv.addWeighted(mat, p, temp4, 1 - p, 0.0, dst);
     cv.add(dst, new cv.Mat(mat.rows, mat.cols, mat.type(), new cv.Scalar(10, 10, 10, 0)), dst);
     cv.imshow('res', dst);
     mat.delete();
}