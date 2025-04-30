import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:treat/core/routes/routes_manager.dart';
import 'package:treat/core/widgets/custom_button.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, this.forcedLocation}) : super(key: key);
  final LatLng? forcedLocation;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng? currentLocation;
  LatLng? selectedLocation;
  bool isLoading = true;
  bool locationPermissionGranted = false;
  final TextEditingController _searchController = TextEditingController();
  CameraPosition? _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    if (widget.forcedLocation != null) {
      // إذا كان هناك موقع مفروض (من زر Deny)
      _initialCameraPosition = CameraPosition(
        target: widget.forcedLocation!,
        zoom: 19,
      );
      setState(() {
        // selectedLocation = widget.forcedLocation;
        // currentLocation = widget.forcedLocation;
        isLoading = false;
      });
    } else {
      // وإلا حاول الحصول على الموقع الحالي
      _getCurrentLocation();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        
        _initialCameraPosition = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15,
        );
        
        setState(() {
          currentLocation = LatLng(position.latitude, position.longitude);
          selectedLocation = currentLocation;
          isLoading = false;
          locationPermissionGranted = true;
        });
      } catch (e) {
        _useDefaultLocation();
      }
    } else {
      _useDefaultLocation();
    }
  }

  void _useDefaultLocation() {
    // الموقع الافتراضي: الرياض، السعودية
    final defaultLocation = LatLng(24.7136, 46.6753);
    _initialCameraPosition = CameraPosition(
      target: defaultLocation,
      zoom: 15,
    );
    setState(() {
      selectedLocation = defaultLocation;
      currentLocation = defaultLocation;
      isLoading = false;
      locationPermissionGranted = false;
    });
  }

  void _onMapTapped(LatLng location) {
    setState(() {
      selectedLocation = location;
    });
  }

  void _confirmLocation() {
    if (selectedLocation != null) {
      Navigator.pushNamed(context, RoutesManager.nav);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرجاء تحديد موقع على الخريطة')),
      );
    }
  }

  Future<void> _handleSearch() async {
    if (_searchController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرجاء إدخال عنوان للبحث')),
      );
      return;
    }

    try {
      List<Location> locations = await locationFromAddress(_searchController.text);
      if (locations.isNotEmpty) {
        final location = locations.first;
        final newLocation = LatLng(location.latitude, location.longitude);
        
        setState(() {
          selectedLocation = newLocation;
        });
        
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(newLocation, 15),
        );
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم العثور على الموقع')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('لم يتم العثور على الموقع')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ أثناء البحث: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'ابحث عن موقع...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _searchController.clear();
                    FocusScope.of(context).unfocus();
                  },
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              onSubmitted: (value) => _handleSearch(),
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
                // تأكيد تحريك الكاميرا للموقع المطلوب بعد تحميل الخريطة
                if (widget.forcedLocation != null) {
                  mapController.animateCamera(
                    CameraUpdate.newLatLngZoom(widget.forcedLocation!, 15),
                  );
                }
              },
              initialCameraPosition: _initialCameraPosition ?? CameraPosition(
                target: LatLng(24.7136, 46.6753), // الرياض كموقع افتراضي
                zoom: 15,
              ),
              myLocationEnabled: widget.forcedLocation == null,
              myLocationButtonEnabled: widget.forcedLocation == null,
              onTap: widget.forcedLocation == null ? _onMapTapped : null,
              markers: {
                if (currentLocation != null)
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    position: currentLocation!,
                    infoWindow: InfoWindow(title: 'موقعك الحالي'),
                  ),
                if (selectedLocation != null && selectedLocation != currentLocation)
                  Marker(
                    markerId: MarkerId('selectedLocation'),
                    position: selectedLocation!,
                    infoWindow: InfoWindow(title: 'الموقع المحدد'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                  ),
              },
            ),
      floatingActionButton: 
           FloatingActionButton(
              onPressed: _getCurrentLocation,
              child: Icon(Icons.my_location),
            )
          ,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomButton(
            lable: 'Confirm_pin_location',
            onTap: _confirmLocation,
          ),
        ),
      ),
    );
  }
}