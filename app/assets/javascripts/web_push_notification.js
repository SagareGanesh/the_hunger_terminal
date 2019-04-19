if ("serviceWorker" in navigator) {
  console.log("Service Worker is supported");
  navigator.serviceWorker
    .register("/serviceworker.js")
    .then(function(registration) {
      console.log("Successfully registered!", ":^)", registration);
      registration.pushManager
        .subscribe({ userVisibleOnly: true })
        .then(function(subscription) {
          console.log("endpoint:", subscription.endpoint);
        });
    })
    .catch(function(error) {
      console.log("Registration failed", ":^(", error);
    });
}
