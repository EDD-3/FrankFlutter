import 'package:news_app/features/gates/domain/entities/lane.dart';

bool isNotOperational(String status) =>
    status == 'Lanes Closed' || status == 'Update Pending' || status == 'N/A';

bool isLaneNotOperational(Lane commercialLane, String gateStatus) =>
    commercialLane == null ||
    commercialLane.standarLane == null ||
    gateStatus == 'Closed';
