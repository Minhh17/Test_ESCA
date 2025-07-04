import os
import sys
import arg_parser 
sys.path.append(os.getcwd())
from core.DataLoader import Dataloader
from config.config_manager import ConfigManager

import tensorflow as tf

 # argument parser for custom paths
def parse_args():
	parser = argparse.ArgumentParser(description="Create TFRecord dataset")
	parser.add_argument("--normal", help="Path to normal data")
	parser.add_argument("--anomaly", help="Path to anomaly data")
	parser.add_argument("--output", help="Directory to store TFRecords")
	return parser.parse_args()


# os.environ['CUDA_VISIBLE_DEVICES'] = "1"

gpus = tf.config.list_physical_devices('GPU')
if gpus:
  # Restrict TensorFlow to only use the first GPU
  try:
    tf.config.set_logical_device_configuration(
        gpus[0],
        [tf.config.LogicalDeviceConfiguration(memory_limit=1024*3.5)])
    logical_gpus = tf.config.list_logical_devices('GPU')
    print(len(gpus), "Physical GPUs,", len(logical_gpus), "Logical GPU")
  except RuntimeError as e:
    # Visible devices must be set before GPUs have been initialized
    print(e)

if __name__ == '__main__':

	args = parse_args()
	cfg = ConfigManager()

		# override paths from command line if provided
	if args.normal:
    	cfg._config['DATASET']['PATH']['NORMAL'] = args.normal
    if args.anomaly:
    	cfg._config['DATASET']['PATH']['ANOMALY'] = args.anomaly
	if args.output:
    	cfg._config['DATASET']['PATH']['TFRECORDS'] = [args.output]

    data_loader = Dataloader(cfg)
    data_loader.create_tfrecord()
    data_loader.accumulate_stat()
