'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"styles.css": "ca9068a27b67e4fd49c7b37fdbdfffa6",
"assets/apple-touch-icon-76x76-precomposed.png": "9b9538964f9ba5020254df7975d557b5",
"assets/apple-touch-icon-180x180.png": "2513e50621acdddcea89ff5348261cce",
"assets/android-chrome-144x144.png": "3f0704884c17abeff3c5031acbaac5d2",
"assets/apple-touch-icon-152x152-precomposed.png": "43b1ce22b8a916c04ead4dea7cfd5c07",
"assets/android-chrome-512x512.png": "f9844481733419279665666d0e9aee0f",
"assets/apple-touch-icon-60x60-precomposed.png": "f50d5f05200811787d4f6deb34aef78e",
"assets/assets/arrow_120x120.png": "a663da90383e5925c5861d1e1de49b05",
"assets/assets/demo/demo_4_after.webp": "d0d364ef1490ba9fccbfe965962ae868",
"assets/assets/demo/demo_2_before.webp": "3b614831aa97a30e3f273588287d4814",
"assets/assets/demo/demo_5_before.webp": "4183b6ad10fdf9955428ef5ebae0bf8e",
"assets/assets/demo/demo_3_before.webp": "1f85b5b11c3fda91f7f70b7ed51ce090",
"assets/assets/demo/demo_1_after.webp": "84b37af8889571a5d86283d5627d2ff3",
"assets/assets/demo/demo_2_after.webp": "514999eb46c88a15f4fe04426b9cf51a",
"assets/assets/demo/demo_6_after.webp": "1bdacdba4917c56ddaf60c01fb6960ff",
"assets/assets/demo/demo_1_before.webp": "60fdb06d7ffc9a4f1ff654af0e4031fc",
"assets/assets/demo/demo_4_before.webp": "9004fe7adb10194a179a81d70556f6d9",
"assets/assets/demo/demo_3_after.webp": "7b19b301d64f609571fbcf49b60bcc5c",
"assets/assets/demo/demo_5_after.webp": "6720d916818d8eef8649f17b82c58a44",
"assets/assets/demo/demo_6_before.webp": "59892a144adcf4de995194c217339a57",
"assets/assets/js/app.js": "113e83ac29c6d4add0d2d5a0ae161b7c",
"assets/assets/dot_bg.webp": "a89091d0cec7a96a64a2548efb284161",
"assets/assets/icons/app_icon.png": "6a2322caaeadda14af9c8adf1fbb5b69",
"assets/mstile-150x150.png": "624af38701c7673259a55b217fa263f2",
"assets/favicon-32x32.png": "e181a30cbd6d4d04a1c3963be38cc27a",
"assets/apple-touch-icon-144x144-precomposed.png": "4babfe0e2eeda8f0238c1629cc39479e",
"assets/android-chrome-256x256.png": "0a18a3ac4830f09df2ae2656c37d18e5",
"assets/apple-touch-icon-180x180-precomposed.png": "ca1d9181533fa76de9b01b36ebccd30c",
"assets/mstile-144x144.png": "58c117e9ada5be1b1d6befe83c38fa13",
"assets/demo_3_before.jpeg": "0cd4a5e3eaa07171b692cfebaef02257",
"assets/site.webmanifest": "1cfcef35a7474e6e0a1e26cf75d3a5db",
"assets/fonts/MaterialIcons-Regular.otf": "17ddea1b47dd18a4d1032b7970961e2b",
"assets/android-chrome-192x192.png": "415b5e011b0e03b5505c04dcfcb1388e",
"assets/apple-touch-icon.png": "2513e50621acdddcea89ff5348261cce",
"assets/apple-touch-icon-120x120.png": "b5ee8b3a65eeda68060873436bc9ef30",
"assets/favicon.ico": "94efeb3747de6c092ca694b187a19303",
"assets/apple-touch-icon-57x57-precomposed.png": "36c3e18e1d9968fedeec89d732d86311",
"assets/apple-touch-icon-114x114-precomposed.png": "0626e0205adaa82333b996909bb48e15",
"assets/android-chrome-48x48.png": "89f70d23f1ad3f27ff4e149a7657dc9d",
"assets/AssetManifest.json": "accf152c92df188231ba2fdc1a7af017",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/flutter_dropzone_web/assets/flutter_dropzone.js": "ec6cc114195fbeef7767f059790356fd",
"assets/apple-touch-icon-114x114.png": "4866d864523a4a7a23057ed03d8190ab",
"assets/apple-touch-icon-72x72-precomposed.png": "c9e2e42334572804fd60190a07aeecff",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/apple-touch-icon-57x57.png": "4f98f836c047fbcd7b0ddca148e78e48",
"assets/android-chrome-384x384.png": "763f2c9b9ee61eae28d9b413d31e0747",
"assets/apple-touch-icon-76x76.png": "ea6f0cf44d97b649ed976d22d70beeed",
"assets/apple-touch-icon-120x120-precomposed.png": "4071d27b7d481297dadb48135fa017da",
"assets/apple-touch-icon-60x60.png": "f10cf5f9d3814c8dd0149b927b7960fb",
"assets/AssetManifest.bin": "6540b95c1e590551dfeced8cc33e19a4",
"assets/apple-touch-icon-72x72.png": "e84a7b3b79f234c5d3717524638f2770",
"assets/apple-touch-icon-152x152.png": "526723ec95c0c08f12843c8d747c4a90",
"assets/android-chrome-36x36.png": "6a2322caaeadda14af9c8adf1fbb5b69",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/android-chrome-72x72.png": "49dcd502bad249c843200bc9a3e71263",
"assets/android-chrome-96x96.png": "9334dc5d1b9268f0016897728636aa95",
"assets/apple-touch-icon-precomposed.png": "ca1d9181533fa76de9b01b36ebccd30c",
"assets/favicon-16x16.png": "ab2da0fe687c3794b9bf95d74b0219c8",
"assets/safari-pinned-tab.svg": "d2cd9c6d54f61cfb8b0f575e3bb83703",
"assets/browserconfig.xml": "a493ba0aa0b8ec8068d786d7248bb92c",
"assets/apple-touch-icon-144x144.png": "a90b288bf78c9660a9ccd729ccf4bbcd",
"assets/NOTICES": "ff1a0aa0ddb971c71b0a7294b46f328b",
"version.json": "bdb38712ea1ae98022361a770ec84cbb",
"manifest.json": "e68365ab7d1b96db91b0e239687292fb",
"index.html": "cbf299a644a84e5a1369a7c338c3b9e8",
"/": "cbf299a644a84e5a1369a7c338c3b9e8",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"opencv.js": "9dd0f2d934307d7a7fafc9a0fc102d47",
"main.dart.js": "a547e8499178d472d30d0c3a79967b12",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
