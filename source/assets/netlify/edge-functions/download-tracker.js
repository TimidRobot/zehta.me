// https://docs.netlify.com/build/edge-functions/overview/
// https://plausible.io/docs/events-api
export default async (request) => {
  console.log("download-tracker 1");
  fetch("https://zehta.me/418/api/event", {
    method: "POST",
    body: JSON.stringify({
      "domain": "zehta.me",
      "name": "Download Tracker",
      "url": request.url
    }),
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
      "User-Agent": request.headers.get("User-Agent"),
      "X-Forwarded-For": request.headers.get("X-Forwarded-For")
    }
  })
    .then((response) => console.log(response));
  console.log("download-tracker 2");
  //console.log("LOGMESSAGE");
  return;
}
// vim: set ts=2 sw=2 et:
