pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton {
    id: root

    property QtObject defaultAdapter: QtObject {
        property BluetoothAdapter adapter: Bluetooth.defaultAdapter
        property string iconName: [BluetoothAdapterState.Blocked, BluetoothAdapterState.Disabled].includes(adapter.state) ? "bluetooth-disabled-symbolic" 
        : adapter.state == BluetoothAdapterState.Enabled ? 
            adapter.devices.values.some( device => device.state == BluetoothDeviceState.Connected ) ? "bluetooth-paired-symbolic" 
            : "bluetooth-active-symbolic"
        : "bluetooth-disconnected-symbolic" ;
        // property string iconName: adapter.state == BluetoothAdapterState.Blocked ? "bluetooth-hardware-disabled-symbolic" 
        // : adapter.state == BluetoothAdapterState.Disabled ? "bluetooth-disabled-symbolic" 
        // : adapter.state == BluetoothAdapterState.Enabled ? 
        //     adapter.devices.values.some( device => device.state == BluetoothDeviceState.Connected ) ? "bluetooth-paired-symbolic" 
        //     : adapter.devices.values.some( device => [BluetoothDeviceState.Connecting, BluetoothDeviceState.Disconnecting].includes(device.state) ) ? "bluetooth-acquiring-symbolic" 
        //     : adapter.devices.values.some( device => device.pairing ) ? "bluetooth-acquiring-symbolic" 
        //     : "bluetooth-disconnected-symbolic"
        // : "bluetooth-acquiring-symbolic" ;
    }
}
