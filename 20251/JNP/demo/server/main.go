package main

import (
    "context"
    "fmt"
    "log"
    "net"

    "google.golang.org/grpc"

    "protobuf/hello" // import path phải khớp với go_package
)

// Cấu trúc server kế thừa interface HelloServiceServer (được sinh ra từ .proto)
type server struct {
    hello.UnimplementedHelloServiceServer
}

// Cài đặt hàm Hello
func (s *server) Hello(ctx context.Context, req *hello.String) (*hello.String, error) {
    msg := fmt.Sprintf("Xin chào, %s!", req.Value)
    return &hello.String{Value: msg}, nil
}

func main() {
    lis, err := net.Listen("tcp", ":50051")
    if err != nil {
        log.Fatalf("Không thể lắng nghe: %v", err)
    }

    grpcServer := grpc.NewServer()
    hello.RegisterHelloServiceServer(grpcServer, &server{})

    log.Println("🚀 Server đang chạy tại :50051 ...")
    if err := grpcServer.Serve(lis); err != nil {
        log.Fatalf("Lỗi khi chạy server: %v", err)
    }
}
