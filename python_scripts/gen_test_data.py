import sys
output_path = "./test_data/"
header_file_path = "./test_data/"
try:
	import cPickle as pickle
except:
	import pickle

import gzip
import numpy as np

data_width = 16
int_width = 1
try:
	test_data_num = int(sys.argv[1])
except:
	test_data_num = 3

def convert_to_binary(num,data_width,fract_width):
	if(num>0):
		num=num*(2**fract_width)
		d=int(num)
	else:
		num=-num
		num=num*(2**fract_width)
		if num == 0:
			d=0
		else:
			d= 2**data_width - num
	return d

def load_data():
	f=gzip.open('mnist.pkl.gz','rb')
	try:
		training_data,validation_data, test_data = pickle.load(f,encoding='latin1')
	except:
		training_data,validation_data,test_data = pickle.load(f)
	f.close()
	return (training_data,validation_data,test_data)

def gen_all_test_data(data_width, int_size):
	# data_header_file = open(header_file_path+"data_values.h","w")
	# data_header_file.write("int dataValues[]={")
	tr_d,va_d,te_d = load_data()
	test_inputs = [np.reshape(x,(1,784)) for x in te_d[0]]
	x=len(test_inputs[0][0])
	fract_width= data_width- int_width
	for i in range(len(test_inputs)):
		if i<10:
			ext = "000"+str(i)
		elif i<100:
			ext= "00"+str(i)
		elif i<1000:
			ext = "0"+str(i)
		else:
			ext = str(i)
		file_name = 'test_data_'+ext+'.txt'
		f=open(output_path+file_name,'w')
		for j in range(0,x):
			d_in_decimal=convert_to_binary(test_inputs[i][0][j],data_width,fract_width)
			data= bin(d_in_decimal)[2:]
			f.write(data+'\n')
		f.write(bin(convert_to_binary((te_d[1][i]),data_width,0))[2:])
		f.close()

if __name__ == "__main__":
	gen_all_test_data(data_width,int_width)


