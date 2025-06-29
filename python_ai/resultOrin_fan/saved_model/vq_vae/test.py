import onnx, onnxruntime as ort, numpy as np

m = onnx.load("vqvae32.onnx")
print("Graph input shape:", m.graph.input[0].type.tensor_type.shape.dim)

sess = ort.InferenceSession("vqvae32.onnx")
x = np.random.rand(1, 1, 32, 32).astype(np.float32)     # NCHW
y = sess.run(None, {"input_1": x})
print("Output shape(s):", [t.shape for t in y])

