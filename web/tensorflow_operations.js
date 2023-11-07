async function loadModel() {
    // Assuming your model.json and bin files are located in the `models` directory under `web`.
    const model = await tf.loadLayersModel('/models/model.json');
    return model;
  }
  
  async function predictImage(model, imageData) {
    // Preprocess the image data to match your model input requirements
    const tensor = tf.browser.fromPixels(imageData).toFloat().expandDims(0);
    const prediction = await model.predict(tensor).data();
    return prediction;
  }
  
  // Expose the functions to the window object to make them accessible from Dart
  window.loadModel = loadModel;
  window.predictImage = predictImage;
  