import request from "supertest"
import app from "./app"

it("sanity check", () => {
	expect(1).toBe(1)
})

describe("base route answers", () => {
	it("'/' returns 400 response", async () => {
		const res = await request(app).get("/")
		expect(res.statusCode).toBe(200)
	})
})
