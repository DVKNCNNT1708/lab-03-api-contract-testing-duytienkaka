# Consumer-Provider Handshake

## Thong tin chung

- Lab: FIT4110 Lab 03
- Ngay: 2026-05-25
- Provider team: team-vision
- Consumer team: team-camera
- Provider service: AI Vision Detection API
- Consumer service: Camera Stream

## Contract

- Contract file: `openapi.yaml`
- Mock base URL: `http://localhost:4010`
- Auth method: `Authorization: Bearer <token>`
- Endpoint duoc test: `POST /vision/detect`

## Smoke test

### Request

```http
POST /vision/detect
Authorization: Bearer lab-token
Content-Type: application/json
X-Correlation-Id: CORR-20260512-0001
```

```json
{
  "requestId": "REQ-CAM-20260512-0090",
  "cameraId": "CAM-ER-01",
  "capturedAt": "2026-05-12T08:09:00Z",
  "traceId": "TRACE-20260512-0090",
  "zoneId": "ER-ENTRANCE",
  "motionLevel": 0.88,
  "imageSource": {
    "sourceType": "IMAGE_URL",
    "url": "https://media.hospital.local/camera/CAM-ER-01/frame-1090.jpg"
  }
}
```

### Expected response

```json
{
  "detectionId": "DET-20260512-0001",
  "requestId": "REQ-CAM-20260512-0001",
  "traceId": "TRACE-20260512-0001",
  "status": "PROCESSING",
  "acceptedAt": "2026-05-12T08:00:01Z",
  "preliminaryResult": null
}
```

## Ket qua

- [x] Consumer goi mock thanh cong.
- [x] Consumer parse duoc `detectionId` va `status`.
- [x] Consumer hieu loi 5xx provider tra ve qua scenario `Prefer: code=503`.
- [x] Co Newman report trong `reports/newman-report.xml` va `reports/newman-report.html`.

## Ghi chu thay doi hop dong

| Noi dung | Truoc | Sau | Nguoi dong y |
|---|---|---|---|
| File contract dung cho toolchain lab | Ban chot cua nhom Provider | `openapi.yaml` duoc giu nguyen va dung truc tiep cho lint/mock test | team-vision |
| Endpoint smoke test | Chua co evidence consumer | Camera Stream goi AI Vision mock qua `POST /vision/detect` | team-camera / team-vision |

## Xac nhan

- Provider representative: team-vision
- Consumer representative: team-camera
