// https://docs.netlify.com/build/edge-functions/overview/
// https://plausible.io/docs/events-api
export default async (request) => {
  console.log("download-tracker begin");
  console.log(request.headers.get("User-Agent"))
  console.log(request.headers.get("X-Forwarded-For"))
  try {
    const response = await fetch("https://zehta.me/418/api/event", {
      method: "POST",
      body: JSON.stringify({
        "domain": "zehta.me",
        "name": "Download Tracker",
        "url": request.url
      }),
      headers: {
        "Content-Type": "application/json",
        "User-Agent": request.headers.get("User-Agent"),
        "X-Forwarded-For": request.headers.get("X-Forwarded-For")
      }
    });
    if (!response.ok) {
      throw new Error(`Response status: ${response.status}`);
    }
    const result = await response.text();
    console.log(`download-tracker text: ${result}`);
  } catch (error) {
    console.error(error.message);
  }
  console.log("download-tracker return");
  return;
}
// vim: set ts=2 sw=2 et:
