#!/bin/bash
protogen --proto_path=. --csharp_out=. +oneof=enum ./*.proto