# Reliability Checklist - FIT4110 Lab 03

Applied to `team-vision` based on `openapi.yaml` and the generated Postman collection.

## 1. Functional tests

- [x] Co test cho endpoint health.
- [x] Co test happy path cho endpoint chinh `POST /vision/detect`.
- [x] Co kiem tra status code 2xx.
- [x] Co kiem tra field quan trong trong response.
- [x] Co it nhat 1 test doc du lieu chi tiet qua `GET /vision/detections/{detectionId}`.

## 2. Auth tests

- [x] Co test thieu token.
- [x] Co test sai token hoac token rong.
- [x] Endpoint public duoc khai bao ro voi `/health`.
- [x] Test local du kien assert 401/403; mock duoc ghi chu ro la khong chung minh auth that.

## 3. Negative tests

- [x] Co test thieu field bat buoc (`imageSource`).
- [x] Co test sai kieu/mau du lieu (`cameraId` sai pattern).
- [x] Co test gia tri ngoai mien (`motionLevel = 1.1`).
- [x] Loi tra ve theo cung mot error model `Problem`.

## 4. Boundary tests

- [x] Co test min/max hoac du lieu sat nguong (`motionLevel = 1`).
- [x] Khong co pagination trong contract nay, nen muc limit/pagination khong ap dung.
- [x] Co test metadata thieu va co response loi tu server.
- [x] Ky vong du lieu bien duoc ghi ro trong collection va matrix.

## 5. Reliability tests co ban

- [x] Co kiem tra response time trong folder `06_Local_only_NonFunctional`.
- [x] Timeout mong muon: local service nen tra loi duoi 1000ms cho `GET /vision/models/info`.
- [x] Co ghi chu retry/rate limiting qua response `429` trong contract va scenario `503` trong collection.
- [x] Co consumer-side smoke test voi Camera Stream goi AI Vision mock.

## 6. Evidence

- [x] Collection export JSON.
- [x] Environment mock export JSON.
- [x] Environment local export JSON.
- [x] Newman report XML/HTML se duoc sinh trong `reports/`.
- [x] Test-case matrix da dien.
- [x] Bien ban handshake da dien.

## 7. Remaining local verification

- [ ] Chay `npm run test:local` thanh cong tren service that tai `http://localhost:8000`.
  Blocked: chua co local service dang listen tai `http://localhost:8000`, nen Newman hien tra `ECONNREFUSED`.
- [ ] Xac nhan auth middleware that tra 401/403 dung voi test local.
  Blocked: khong co local service nen khong the xac nhan auth that.
- [ ] Xac nhan SLA local duoi 1000ms bang report thuc te.
  Blocked: khong co local service nen khong co du lieu response time hop le cho local.
