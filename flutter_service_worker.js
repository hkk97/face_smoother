'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "opencv.js": "9dd0f2d934307d7a7fafc9a0fc102d47",
"styles.css": "ca9068a27b67e4fd49c7b37fdbdfffa6",
"main.dart.js": "56bc1afa3c88e655baea9d2eb5939898",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"manifest.json": "e68365ab7d1b96db91b0e239687292fb",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"assets/android-chrome-96x96.png": "9334dc5d1b9268f0016897728636aa95",
"assets/apple-touch-icon-72x72-precomposed.png": "c9e2e42334572804fd60190a07aeecff",
"assets/apple-touch-icon-120x120-precomposed.png": "4071d27b7d481297dadb48135fa017da",
"assets/apple-touch-icon.png": "2513e50621acdddcea89ff5348261cce",
"assets/android-chrome-36x36.png": "6a2322caaeadda14af9c8adf1fbb5b69",
"assets/apple-touch-icon-57x57-precomposed.png": "36c3e18e1d9968fedeec89d732d86311",
"assets/demo_3_before.jpeg": "0cd4a5e3eaa07171b692cfebaef02257",
"assets/apple-touch-icon-180x180.png": "2513e50621acdddcea89ff5348261cce",
"assets/AssetManifest.json": "accf152c92df188231ba2fdc1a7af017",
"assets/apple-touch-icon-114x114-precomposed.png": "0626e0205adaa82333b996909bb48e15",
"assets/apple-touch-icon-60x60-precomposed.png": "f50d5f05200811787d4f6deb34aef78e",
"assets/site.webmanifest": "1cfcef35a7474e6e0a1e26cf75d3a5db",
"assets/shaders/ink_sparkle.frag": "bfd223fd128d659ff8813253d56be66f",
"assets/packages/flutter_dropzone_web/assets/flutter_dropzone.js": "0266ef445553f45f6e45344556cfd6fd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/android-chrome-72x72.png": "49dcd502bad249c843200bc9a3e71263",
"assets/mstile-150x150.png": "624af38701c7673259a55b217fa263f2",
"assets/apple-touch-icon-120x120.png": "b5ee8b3a65eeda68060873436bc9ef30",
"assets/apple-touch-icon-precomposed.png": "ca1d9181533fa76de9b01b36ebccd30c",
"assets/apple-touch-icon-114x114.png": "4866d864523a4a7a23057ed03d8190ab",
"assets/favicon.ico": "94efeb3747de6c092ca694b187a19303",
"assets/browserconfig.xml": "a493ba0aa0b8ec8068d786d7248bb92c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/apple-touch-icon-152x152-precomposed.png": "43b1ce22b8a916c04ead4dea7cfd5c07",
"assets/android-chrome-48x48.png": "89f70d23f1ad3f27ff4e149a7657dc9d",
"assets/apple-touch-icon-60x60.png": "f10cf5f9d3814c8dd0149b927b7960fb",
"assets/android-chrome-144x144.png": "3f0704884c17abeff3c5031acbaac5d2",
"assets/mstile-144x144.png": "58c117e9ada5be1b1d6befe83c38fa13",
"assets/apple-touch-icon-76x76-precomposed.png": "9b9538964f9ba5020254df7975d557b5",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/apple-touch-icon-72x72.png": "e84a7b3b79f234c5d3717524638f2770",
"assets/apple-touch-icon-152x152.png": "526723ec95c0c08f12843c8d747c4a90",
"assets/android-chrome-512x512.png": "f9844481733419279665666d0e9aee0f",
"assets/android-chrome-256x256.png": "0a18a3ac4830f09df2ae2656c37d18e5",
"assets/assets/arrow_120x120.png": "a663da90383e5925c5861d1e1de49b05",
"assets/assets/icons/app_icon.png": "6a2322caaeadda14af9c8adf1fbb5b69",
"assets/assets/js/app.js": "113e83ac29c6d4add0d2d5a0ae161b7c",
"assets/assets/demo/demo_2_before.webp": "3b614831aa97a30e3f273588287d4814",
"assets/assets/demo/demo_3_before.webp": "1f85b5b11c3fda91f7f70b7ed51ce090",
"assets/assets/demo/demo_3_after.webp": "7b19b301d64f609571fbcf49b60bcc5c",
"assets/assets/demo/demo_6_before.webp": "59892a144adcf4de995194c217339a57",
"assets/assets/demo/demo_1_before.webp": "60fdb06d7ffc9a4f1ff654af0e4031fc",
"assets/assets/demo/demo_2_after.webp": "514999eb46c88a15f4fe04426b9cf51a",
"assets/assets/demo/demo_1_after.webp": "84b37af8889571a5d86283d5627d2ff3",
"assets/assets/demo/demo_5_before.webp": "4183b6ad10fdf9955428ef5ebae0bf8e",
"assets/assets/demo/demo_6_after.webp": "1bdacdba4917c56ddaf60c01fb6960ff",
"assets/assets/demo/demo_4_after.webp": "d0d364ef1490ba9fccbfe965962ae868",
"assets/assets/demo/demo_5_after.webp": "6720d916818d8eef8649f17b82c58a44",
"assets/assets/demo/demo_4_before.webp": "9004fe7adb10194a179a81d70556f6d9",
"assets/assets/dot_bg.webp": "a89091d0cec7a96a64a2548efb284161",
"assets/android-chrome-192x192.png": "415b5e011b0e03b5505c04dcfcb1388e",
"assets/apple-touch-icon-180x180-precomposed.png": "ca1d9181533fa76de9b01b36ebccd30c",
"assets/NOTICES": "570b943d5aa9d66a2ed2c7041b7c72cd",
"assets/safari-pinned-tab.svg": "d2cd9c6d54f61cfb8b0f575e3bb83703",
"assets/favicon-16x16.png": "ab2da0fe687c3794b9bf95d74b0219c8",
"assets/favicon-32x32.png": "e181a30cbd6d4d04a1c3963be38cc27a",
"assets/apple-touch-icon-57x57.png": "4f98f836c047fbcd7b0ddca148e78e48",
"assets/android-chrome-384x384.png": "763f2c9b9ee61eae28d9b413d31e0747",
"assets/apple-touch-icon-144x144-precomposed.png": "4babfe0e2eeda8f0238c1629cc39479e",
"assets/apple-touch-icon-76x76.png": "ea6f0cf44d97b649ed976d22d70beeed",
"assets/apple-touch-icon-144x144.png": "a90b288bf78c9660a9ccd729ccf4bbcd",
"index.html": "b22642964f1a5a9a8c086f723b1515c0",
"/": "b22642964f1a5a9a8c086f723b1515c0",
"version.json": "bdb38712ea1ae98022361a770ec84cbb"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
