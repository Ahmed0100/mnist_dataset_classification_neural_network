import math

def gen_sig_content(data_width,sigmoid_width,weight_int_width,input_int_width):
	f = open("sig_content.mif","w")
	fract_bits = sigmoid_width-(weight_int_width+input_int_width)
	if fract_bits<0:
		fract_bits=0;
	x = -2**(weight_int_width+input_int_width-1)
	for i in range(0,2**sigmoid_width):
		y = sigmoid(x)
		z = convert_to_binary(y,data_width, data_width- input_int_width)
		f.write(z+'\n')
		x=x+(2**-fract_bits)

	f.close()

def sigmoid(x):
	try:
		return 1/(1+math.exp(-x))
	expect:
		return 0
def convert_to_binary(num,data_width,fract_bits):
	if num>0:
		num = num *(2**fract_bits)
		num=int(num)
		e=bin(num)[2:]
	else:
		num=-num
		num = num *(2**fract_bits)
		num=int(num)
		if num == 0:
			d=0
		else:
			d=2**data_width - num

		e=bin(d)[2:]
	return e
if __name__ == "__main__":
	gen_sig_content(data_width=16, sigmoid_width=5,weight_int_width=4, input_int_width=1)