import tensorflow as tf
m = tf.saved_model.load("/home/haiminh/Desktop/minh/ESCA_Qt/python_ai/resultFan/saved_model/vq_vae")
for v in m.variables:
    print(v.name, v.dtype) 
