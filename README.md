# iOS CI/CD Pipeline

![CI](https://github.com/yarenunal/ios-ci-cd-pipeline/actions/workflows/ci.yml/badge.svg)

GitHub Actions ile bir SwiftUI projesi için kurduğum CI/CD pipeline'ı. Her push ve pull request'te proje otomatik derlenir ve unit testler çalıştırılır.

## Pipeline ne yapıyor?

- `main` dalına push ve pull request'te tetiklenir
- macOS runner üzerinde projeyi build eder
- Unit testleri iOS Simulator'da çalıştırır

## Yol haritası

- [x] GitHub Actions ile build + test
- [x] SwiftLint
- [ ] Fastlane ile TestFlight'a otomatik yükleme
