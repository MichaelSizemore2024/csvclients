.PHONY: all clean

# Add the export command to update PATH
export PATH := $(PATH):$(shell go env GOPATH)/bin

all: education_proto email_proto generic_proto

education_proto:
	python3 -m grpc_tools.protoc --proto_path=./proto --python_out=common --grpc_python_out=common proto/education.proto

email_proto:
	python3 -m grpc_tools.protoc --proto_path=./proto --python_out=common --grpc_python_out=common proto/email.proto

generic_proto:
	python3 -m grpc_tools.protoc --proto_path=./proto --python_out=common --grpc_python_out=common proto/generic.proto

clean:
	rm -rf common/*