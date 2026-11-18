# iOS CI/CD Pipeline

![CI](https://github.com/yarenunal/ios-ci-cd-pipeline/actions/workflows/ci.yml/badge.svg)

GitHub Actions ile bir SwiftUI projesi için kurduğum CI/CD pipeline'ı. Proje bilerek minimal tutuldu, amaç uygulama değil pipeline.

## Pipeline ne yapıyor?

`main` dalına push ve pull request'lerde macOS runner üzerinde şu adımlar çalışır:

1. **SwiftLint:** Kod stili kontrolü. Kurallara uymayan kod yeşil tiki alamaz.
2. **Simulator seçimi:** Runner'da kullanılabilir bir iPhone simulator'ı dinamik olarak bulunur.
3. **Build + unit testler:** `xcodebuild test` ile proje derlenir ve testler iOS Simulator'da çalışır.
4. **Test raporu:** `.xcresult` dosyası, test başarısız olsa bile artifact olarak saklanır.

## Güvenlik ağları

- **Branch protection:** `main`'e doğrudan push kapalı. Her değişiklik pull request ile gelir ve `build-and-test` kontrolü yeşil olmadan merge edilemez.
- **Concurrency:** Aynı branch'e art arda push yapılınca eski çalışmalar iptal edilir.
- **Timeout:** Takılan bir iş 30 dakikada otomatik durur.
- **Dependabot:** GitHub Actions sürümleri haftalık kontrol edilir ve güncelleme PR'ları otomatik açılır.

## Yol haritası

- [x] GitHub Actions ile build + test
- [x] SwiftLint kalite kapısı
- [x] Test raporunu artifact olarak kaydetme
- [x] Branch protection ve zorunlu status check
- [x] Dependabot ile action güncellemeleri
- [ ] Fastlane ile TestFlight'a otomatik yükleme

## Yolda yaşadığım sorunlar

- Projem, tüm Xcode projelerimin durduğu bir üst klasörün git reposu içindeydi. `git rev-parse --show-toplevel` ile git kökünü kontrol edip projeyi bağımsız bir repoya taşıdım.
- Aynı `xcodebuild` komutu bir çalışmada başarılı, bir diğerinde `Unable to find a device matching the provided destination specifier` hatası verdi. Simulator adını sabit yazmak yerine, runner'da mevcut cihazı bulan bir adım yazdım.
- Bazı çalışmalar kodla ilgisiz şekilde `The job was not acquired by Runner of type hosted` hatasıyla kırmızı bitti. Yeniden çalıştırınca geçti.
- Bilerek bozduğum bir testin pipeline tarafından yakalandığını ve branch protection sayesinde `main`'e giremediğini doğruladım.
