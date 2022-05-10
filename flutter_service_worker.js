'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "e9b5fae1e1eb4310b06d6ecc945866b9",
"/": "e9b5fae1e1eb4310b06d6ecc945866b9",
"manifest.json": "1e3fd5dc223f1bdaec22504c13d04102",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "e3d1e217928431b50f9dc967ee094127",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "4aac1359cb8a7a1072668483faae97bd",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/assets/tiles/floor_plan_1.tmx": "9bed81d6ef271eb48a4de2d09ef00518",
"assets/assets/tiles/office.tmx": "9aebe6b6d426a6aca47dd99f58ea95d6",
"assets/assets/tiles/office_2_export.tmx": "e4e622f53c27426d6645e7314370c414",
"assets/assets/tiles/map.tmx": "fe7f2999e4e1c3108bfaeaf3ae5b487b",
"assets/assets/tiles/Office_Design_2.tmx": "1e858551f743a00a88b263e1fe30a136",
"assets/assets/images/1_Generic_32x32.png": "48e27dc182a747eb53cec842259a57ae",
"assets/assets/images/Interiors_free_32x32.png": "9165a65b10d412d8af360193c7cedcd6",
"assets/assets/images/Modern_Exteriors_Singles_Fountain_32x32_1.png": "1cba1904c60e38dfc3f6374b2d3dd9c8",
"assets/assets/images/red_gem.png": "3702fb2e23befd4484d89dcf130db294",
"assets/assets/images/Premade_Character_32x32_15.png": "a7f9f03c173e2f08321171d28faab0b3",
"assets/assets/images/office.png": "5ed36297afe3efee60f48951a548e058",
"assets/assets/images/Modern_Exteriors_RTU_2_preview_32x32.png": "e3504d1a1516b95c4e94b25566f56a1b",
"assets/assets/images/5_Classroom_and_library_32x32.png": "6c3e9bd6ea98ad005bbdd81f5762345a",
"assets/assets/images/Premade_Character_32x32_01.png": "224c3e8b463055bfcf57d6701c277d0e",
"assets/assets/images/7_Art_32x32.png": "f9a847f7d025b50c6a26e4101d3c5313",
"assets/assets/images/Modern_Exteriors_Singles_Flowers_32x32_2.png": "b4d8e5a9106de890d508b7ea28be0f7f",
"assets/assets/images/Adam_run_16x16.png": "04d9257b4abd487f04d45fb30059c8ac",
"assets/assets/images/floor_plan_1.png": "c8baa4efc44bf4085dfbb0982688e577",
"assets/assets/images/animated_receptionist_2_32x32.gif": "a10d4f82880724dd4b1d062656f9d0f0",
"assets/assets/images/Modern_Exteriors_Singles_Tree_32x32_8.png": "8b583bd220fed1f640b6f9be270ea31b",
"assets/assets/images/office_2_export.png": "5ed36297afe3efee60f48951a548e058",
"assets/assets/images/floor_plan_0.png": "b4c2d884f426d5bd14e01d99e17ca74a",
"assets/assets/images/Modern_Exteriors_Singles_Tree_32x32_1.png": "2e1faaaf0427bb246852c378f1146dd3",
"assets/assets/images/2_LivingRoom_32x32.png": "b93806d1cf5a3c329f35a97d3161b290",
"assets/assets/images/Room_Builder_Office_32x32.png": "14f23c6a04eb36c2b22f0a1dc11ea870",
"assets/assets/images/Room_Builder_3d_walls_32x32.png": "29063a61481a91bff81e9ecb35fc7d85",
"assets/assets/images/Office_Design_2.gif": "e0907cfc890735e70146e02229c33295",
"assets/assets/images/Premade_Character_32x32_07.png": "06b7df7a0aeaf081018ca14f7b329eff",
"assets/assets/images/Modern_Office_Black_Shadow_32x32.png": "1eca6f80c5699010cff119fc08ce645a",
"assets/assets/images/Modern_Office_Shadowless_32x32.png": "3627d950f7d7b2a33f456a1617a1ace5",
"assets/assets/images/animated_receptionist_32x32.gif": "d6d49b875ccbd1557874f0628703f253",
"assets/assets/audio/bensound-enigmatic.mp3": "0aeb6d44b492a6e922b862ef4a58581a",
"assets/AssetManifest.json": "6eb837aaa02c14aed2c555b5ff7a5504",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"main.dart.js": "060666ee8d3c76444864a3783699e08e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
