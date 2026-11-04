import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Shipment, TransportVehicle } from '../models/logistics.model';

@Injectable({
  providedIn: 'root'
})
export class LogisticsService {
  private shipments: Shipment[] = [
    {
      id: 'SHP-001',
      trackingNumber: 'GLS-8839201',
      origin: 'Shanghai, China',
      destination: 'Hamburg, Germany',
      status: 'In Transit',
      transportType: 'Maritime',
      cargoWeightKg: 42000,
      estimatedDelivery: '2026-11-20',
      sender: 'Pacific Ocean Trading Co.',
      receiver: 'EuroLogistics GmbH'
    },
    {
      id: 'SHP-002',
      trackingNumber: 'GLS-9912043',
      origin: 'Bogotá, Colombia',
      destination: 'Miami, USA',
      status: 'Customs Clear',
      transportType: 'Air',
      cargoWeightKg: 3500,
      estimatedDelivery: '2026-11-06',
      sender: 'Andean Cargo Express',
      receiver: 'US Global Distribution'
    },
    {
      id: 'SHP-003',
      trackingNumber: 'GLS-1029384',
      origin: 'Rotterdam, Netherlands',
      destination: 'Warsaw, Poland',
      status: 'Delivered',
      transportType: 'Land',
      cargoWeightKg: 18000,
      estimatedDelivery: '2026-11-02',
      sender: 'Dutch Transports BV',
      receiver: 'Polska Logistics Sp. z o.o.'
    }
  ];

  private vehicles: TransportVehicle[] = [
    { id: 'V-101', code: 'EVER-GIVEN-II', type: 'Cargo Vessel', capacityKg: 12000000, currentLocation: 'Suez Canal', status: 'Active', fuelLevelPercentage: 82 },
    { id: 'V-202', code: 'BOEING-777F', type: 'Freight Plane', capacityKg: 102000, currentLocation: 'Bogotá (BOG)', status: 'Active', fuelLevelPercentage: 95 },
    { id: 'V-303', code: 'VOLVO-FH16', type: 'Semi Truck', capacityKg: 24000, currentLocation: 'Berlin', status: 'Idle', fuelLevelPercentage: 60 }
  ];

  constructor() {}

  getShipments(): Observable<Shipment[]> {
    return of(this.shipments);
  }

  getVehicles(): Observable<TransportVehicle[]> {
    return of(this.vehicles);
  }

  addShipment(shipment: Shipment): Observable<Shipment> {
    this.shipments.push(shipment);
    return of(shipment);
  }
}
