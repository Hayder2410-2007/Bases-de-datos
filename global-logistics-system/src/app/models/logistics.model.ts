export interface Shipment {
  id: string;
  trackingNumber: string;
  origin: string;
  destination: string;
  status: 'Pending' | 'In Transit' | 'Customs Clear' | 'Delivered' | 'Delayed';
  transportType: 'Maritime' | 'Air' | 'Land' | 'Rail';
  cargoWeightKg: number;
  estimatedDelivery: string;
  sender: string;
  receiver: string;
}

export interface TransportVehicle {
  id: string;
  code: string;
  type: 'Cargo Vessel' | 'Freight Plane' | 'Semi Truck' | 'Cargo Train';
  capacityKg: number;
  currentLocation: string;
  status: 'Active' | 'Maintenance' | 'Idle';
  fuelLevelPercentage: number;
}
