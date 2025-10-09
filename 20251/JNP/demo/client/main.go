package main

import (
    "context"
    "log"
    "time"

    "google.golang.org/grpc"
    "protobuf/hello"
)

func main() {
    // Kết nối tới server
    conn, err := grpc.Dial("localhost:50051", grpc.WithInsecure())
    if err != nil {
        log.Fatalf("Không thể kết nối: %v", err)
    }
    defer conn.Close()

    client := hello.NewHelloServiceClient(conn)

    ctx, cancel := context.WithTimeout(context.Background(), time.Second)
    defer cancel()

    res, err := client.Hello(ctx, &hello.String{Value: "Tuk"})
    if err != nil {
        log.Fatalf("Gọi RPC lỗi: %v", err)
    }

    log.Printf("✅ Phản hồi từ server: %s", res.Value)
}
