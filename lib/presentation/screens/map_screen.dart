import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../map_bloc/map_cubit.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/my_google_map.dart';
import '../widgets/search_item.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapCubit = BlocProvider.of<MapCubit>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: mapCubit.getMyCurrentLocation,
          child: const Icon(Icons.my_location),
        ),
        body: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) => mapCubit.position != null
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    MyGoogleMap(
                      initialCameraPosition: mapCubit.initialCameraPosition,
                      markers: mapCubit.markers,
                      onMapCreated: (GoogleMapController controller) =>
                          mapCubit.mapController = controller,
                      polyline: const {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CustomSearchBar(
                        controller: mapCubit.floatingSearchController,
                        onQueryChanged: (query) =>
                            mapCubit.getAutoCompleteSearch(query: query),
                        builder: (context, transition) =>
                            mapCubit.autoCompleteSearchModel != null
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: mapCubit.autoCompleteSearchModel
                                        ?.predictions?.length,
                                    itemBuilder: (context, index) {
                                      final search = mapCubit
                                          .autoCompleteSearchModel
                                          ?.predictions?[index];
                                      return SearchItem(
                                        onTap: () => mapCubit.getPlaceDetails(
                                          placeId: search?.placeId,
                                          title: search?.description,
                                        ),
                                        prediction: search,
                                      );
                                    },
                                  )
                                : const SizedBox(),
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
