let model;

// Load your model
async function loadModel() {
  model = await tf.loadLayersModel('path/to/your/model.json');
}

// Call this function to preprocess the image and predict
async function predictImage(imageData) {
  const tfImage = tf.browser.fromPixels(imageData);
  const resizedImage = tf.image.resizeBilinear(tfImage, [224, 224]);
  const normalizedImage = resizedImage.div(255.0).expandDims(0);
  const predictions = await model.predict(normalizedImage);
  const predictedLabel = predictions.argMax(1).dataSync()[0];
  return predictedLabel;
}

// Load the model right away
loadModel();